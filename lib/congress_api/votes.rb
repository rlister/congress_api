module CongressApi
  class Votes < V1
    def roll_call(congress, chamber, session, roll_call_number)
      v1.get("/#{congress}/#{chamber}/sessions/#{session}/votes/#{roll_call_number}.json").parsed_response.results.votes.vote
    end

    def by_type(congress, chamber, type) # missed, party, loneno or perfect
      v1.get("/#{congress}/#{chamber}/votes/#{type}.json").parsed_response.results.first
    end

    ## pass yyyy, mm, or start and end dates as yyyy-mm-dd
    def by_date(chamber, year, month)
      v1.get("/#{chamber}/votes/#{year}/#{month}.json").parsed_response.results
    end

    def nominations(congress)
      v1.get("/#{congress}/nominations.json").parsed_response.results.first
    end
  end
end