# frozen_string_literal: true

module SportRadar
  module NFL
    module V2
      class Game
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
