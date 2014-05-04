class Photo < ActiveRecord::Base
  module Sequence
    def next_record_id
      @next_record_id ||= next_records.limit(1).pluck(:id).first
    end

    def previous_record_id
      @previous_record_id ||= previous_records.limit(1).pluck(:id).last
    end

    private

    def next_records
      self.class.sorted.published.where("id > :id", id: id)
    end

    def previous_records
      self.class.sorted.published.where("id < :id", id: id)
    end
  end
end
