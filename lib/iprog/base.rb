module Iprog
   class Error < StandardError; end

  # The core base class for command/service objects using the Template Method Pattern.
  # Override `process_data`, `check_errors`, and other hooks to build reusable logic.
  class Base
    attr_writer :data
    attr_reader :result, :errors, :params

    def self.call(*args, **kwargs)
      if kwargs.any?
        new(**kwargs).call
      elsif args.length == 1 && args.first.is_a?(Hash)
        new(**args.first).call
      else
        raise ArgumentError, "❌ Expected keyword args or a single hash"
      end
    end

    def initialize(**kwargs)
      @params = kwargs.transform_keys(&:to_sym)
      @data   = {}

      set_params_data
      set_static_data
      extract_and_initialize_instance_variables
    end

    def call
      check_errors
      return self if errors?

      process_data
      send_result filtered_response
    end

    def process_data
      {}
    end

    def filtered_response
      filtered_fields.any? ? result_data.slice(*filtered_fields) : result_data
    end

    def filtered_fields
      []
    end

    def check_errors
      nil
    end

    def set(key, value)
      result_data[key] = value
    end

    def result_data
      @data
    end

    def set_params_data
      {}
    end

    def set_static_data
      {}
    end

    def extract_and_initialize_instance_variables
      result_data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def success?
      errors.nil?
    end

    def errors?
      !errors.nil?
    end

    def send_result(data)
      @result = data || []
      self
    end

    def send_error(data)
      @errors = data || []
      self
    end
  end
end
