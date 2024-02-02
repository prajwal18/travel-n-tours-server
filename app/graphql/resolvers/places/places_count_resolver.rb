module Resolvers
  module Places
    class PlacesCountResolver < BaseResolver
      type Int, null: false
      def resolve
        Place.count
      end
    end
  end
end
