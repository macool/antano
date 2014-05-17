class Photo < ActiveRecord::Base
  module Sequence
    def has_previous?
      !!previous_record
    end

    def has_next?
      !!next_record
    end

    def previous_record
      @previous_record ||= self.class.sorted.published.where("position > :position", position: position).last
    end

    def next_record
      @next_record ||= self.class.sorted.published.where("position < :position", position: position).first
    end
  end
end
