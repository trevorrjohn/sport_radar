# frozen_string_literal: true

module SportRadar
  module NBA
    module V4
      class Team
        attr_reader :id

        def initialize(data)
          @data = data
          @id = data['id']
        end

        private

        attr_reader :data
      end
    end
  end
end
