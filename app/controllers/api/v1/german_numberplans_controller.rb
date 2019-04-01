module Api::V1
  class GermanNumberplansController < ApplicationController
    def index

      query = create_sql_query('155553434 -Berl kjkj ')
      @numberplan = GermanNumberplan.find_by_sql(query)
      render json: @numberplan
    end

    private

    def number_params
      params.require(:german_numberplan)
    end

    def create_sql_query(line)
      comment = comment_part(line)
      prefix = prefix_part(line)
      query = "SELECT * FROM german_numberplans WHERE prefix IN (#{prefix}) #{comment} ORDER BY prefix DESC"
    end

    def comment_part(line)
      comment = line.scan(/[[:alpha:]]+/)
      comment.map! do |word|
        word.gsub!(/ae|oe|ue|ss/) do |match|
          case match
          when 'ae' then
            'ä'
          when 'oe' then
            'ö'
          when 'ue' then
            'ü'
          when 'oe' then
            'ß'
          end
        end
        word = " OR comment LIKE '%#{word}%' "
      end
      return comment.join
    end

    def prefix_part(line)
      prefix_array = []
      prefix = ''
      line.gsub(/\+49|0049|(0)|\D|^0|^49/, '')[0...-5].chars.each do |char|
        prefix += char
        prefix_array.push(prefix)
      end
      return prefix_array.join(',')
    end
  end
end