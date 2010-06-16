class Main
  helpers do
    def display_errors(model)
      if errors = present_errors(model)
        %(<ul class="errors">#{errors.map { |e| tag(:li, e) }.join("\n")}</ul>)
      end
    end

    def present_errors(model, klass = model.class.name.downcase)
      return if model.errors.empty?

      model.errors.map do |field, errcode|
        t('%s.%s.%s' % [klass, field, errcode], 
                default: t('errors.%s' % errcode, field: humanize(field)))
      end
    end

    # @example
    #   # in your HAML file
    #   = inline_error(user, :first_name)
    #
    #   # where user is an instance of an Ohm::Model, :first_name
    #   # is an attribute of user
    #  
    # Given the User model and a not_present error on first_name
    # - will use user.errors.first_name.not_present.
    # - fallback to errors.not_present.
    def inline_error(model, field, klass = model.class.name.downcase)
      if pair = model.errors.detect { |fld, err| fld == field }
        fld, errcode = pair 
        t('%s.errors.%s.%s' % [klass, fld, errcode], 
                  default: t('errors.%s' % errcode, field: humanize(field)))
      end
    end
  end
end
