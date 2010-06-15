module Ohm
  # Minimalistic callback support for Ohm::Model.
  #
  # @example
  #
  #   class Post < Ohm::Model
  #     include Ohm::Callbacks
  #
  #     before :validate, :clean_decimals
  #
  #     before :create, :timestamp!
  #     before :save,   :recalc_votes
  #
  #     after  :create, :post_to_twitter!
  #     after  :save,   :sync_ids
  #
  #   protected
  #     def clean_decimals
  #       # sanitize the decimal values here
  #     end
  #
  #     def timestamp!
  #       # do timestamping code here
  #     end
  #
  #     def recalc_votes
  #       # do something here
  #     end
  #
  #     def post_to_twitter!
  #       # do twitter posting here
  #     end
  #
  #     def sync_ids
  #       # do something with the ids
  #     end
  #   end
  #
  module Callbacks
    def self.included(base)
      base.extend Macros
      base.extend Overrides
    end

    module Macros
      # Use to add a before callback on `method`. Only symbols
      # are allowed, no string eval, no block option also.
      #
      # @example
      #
      #   class Post < Ohm::Model
      #     include Ohm::Callbacks
      #
      #     before :create, :timestamp!
      #     before :save,   :recalc_votes
      #
      #   protected
      #     def timestamp!
      #       # do timestamping code here
      #     end
      #
      #     def recalc_votes
      #       # do something here
      #     end
      #   end
      #
      # @param [Symbol] method the method type, `:validate`, `:create`, or `:save`
      # @param [Symbol] callback the name of the method to execute
      # @return [Array] the callback in an array if added e.g. [:timestamp]
      # @return [nil] if the callback already exists
      def before(method, callback)
        unless callbacks[:before][method].include? callback
          callbacks[:before][method] << callback
        end
      end

      # Use to add an after callback on `method`. Only symbols
      # are allowed, no string eval, no block option also.
      #
      # @example
      #
      #   class Post < Ohm::Model
      #     include Ohm::Callbacks
      #
      #     after  :create, :post_to_twitter!
      #     after  :save,   :sync_ids
      #
      #   protected
      #     def post_to_twitter!
      #       # do twitter posting here
      #     end
      #
      #     def sync_ids
      #       # do something with the ids
      #     end
      #   end
      #
      # @param [Symbol] method the method type, `:validate`, `:create`, or `:save`
      # @param [Symbol] callback the name of the method to execute
      # @return [Array] the callback in an array if added e.g. [:timestamp]
      # @return [nil] if the callback already exists
      def after(method, callback)
        unless callbacks[:after][method].include? callback
          callbacks[:after][method] << callback
        end
      end

      # @private internally used to maintain the state of callbacks
      def callbacks
        @callbacks ||= Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = [] }}
      end
    end
  
    # This module is for class method overrides. As of now
    # it only overrides Ohm::Model::create to force calling save
    # instead of calling create so that Model.create will call
    # not only before/after :create but also before/after :save
    module Overrides
      def create(*args)
        model = new(*args)
        model.save
        model
      end
    end

    # Overrides the validate method of Ohm::Model. This is a bit tricky,
    # since typically you override this. Make sure you do something like:
    #
    #   def validate
    #     super
    #
    #     # do your assertions
    #   end
    #
    # This ensures that you call this method when you defined your own validate
    # method.
    #
    # In all honesty, I don't see the value of putting this here, and I'm still
    # weighing if this is _really_ needed.
    def validate
      execute_callback(:before, :validate)
      super
      execute_callback(:after, :validate)
    end

    # The overriden create of Ohm::Model. It checks if the
    # model is valid, and executes all before :create callbacks.
    #
    # If the create succeeds, all after :create callbacks are
    # executed.
    def create
      execute_callback(:before, :create)  if valid?

      super.tap do |is_created|
        execute_callback(:after, :create)  if is_created
      end
    end

    # The overridden save of Ohm::Model. It checks if the model
    # is valid, and executes all before :save callbacks.
    #
    # If the save also succeeds, all after :save callbacks are
    # executed.
    def save
      execute_callback(:before, :save)  if valid?

      super.tap do |is_saved|
        execute_callback(:after, :save)  if is_saved
      end
    end

    def delete
      execute_callback(:before, :delete)
      super.tap do |is_deleted|
        execute_callback(:after, :delete)  if is_deleted
      end
    end

  private
    def execute_callback(position, method)
      self.class.callbacks[position][method].each do |callback|
        __send__(callback)
      end
    end
  end
end
