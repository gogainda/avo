module Avo
  module Fields
    class DateField < TextField
      attr_reader :first_day_of_week
      attr_reader :picker_format
      attr_reader :format
      attr_reader :placeholder
      attr_reader :relative

      def initialize(name, **args, &block)
        @defaults = {
          partial_name: "date-field"
        }

        super(name, **args, &block)

        @first_day_of_week = args[:first_day_of_week].present? ? args[:first_day_of_week].to_i : 0
        @picker_format = args[:picker_format].present? ? args[:picker_format] : "Y-m-d"
        @format = args[:format].present? ? args[:format] : :long
        @placeholder = args[:placeholder].present? ? args[:placeholder] : ""
        @relative = args[:relative].present? ? args[:relative] : false
      end

      def formatted_value
        return if value.blank?

        if @format.is_a?(Symbol)
          value.to_s(@format)
        else
          value.strftime(@format)
        end
      end
    end
  end
end
