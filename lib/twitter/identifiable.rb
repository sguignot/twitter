require 'twitter/base'

module Twitter
  class Identifiable < Base

    def self.fetch(attrs)
      id = attrs[:id]
      @@identity_map[self] ||= {}
      id && @@identity_map[self][id] && @@identity_map[self][id].update(attrs) || super(attrs)
    end

    # Initializes a new object
    #
    # @param attrs [Hash]
    # @return [Twitter::Base]
    def initialize(attrs={})
      if attrs[:id]
        self.update(attrs)
        @@identity_map[self.class] ||= {}
        @@identity_map[self.class][attrs[:id]] = self
      else
        super
      end
    end

    # @param other [Twitter::Identifiable]
    # @return [Boolean]
    def ==(other)
      super || (other.class == self.class && !other.id.nil? && other.id == self.id) || (!other.attrs.empty? && other.class == self.class && other.attrs == self.attrs)
    end

    # @return [Integer]
    def id
      @attrs[:id]
    end

  end
end
