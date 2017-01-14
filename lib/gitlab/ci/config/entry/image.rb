module Gitlab
  module Ci
    class Config
      module Entry
        ##
        # Entry that represents a Docker image.
        #
        class Image < Node
          include Validatable
          include DockerImage

          ALLOWED_KEYS = %i[name entrypoint].freeze

          validations do
            validates :config, hash_or_string: true
            validates :config, allowed_keys: ALLOWED_KEYS

            validates :name, type: String, presence: true
            validates :entrypoint, type: String, allow_nil: true
          end
        end
      end
    end
  end
end
