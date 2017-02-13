module CongressApi
  class Bills < V1
    def recent(congress, chamber, type) # introduced, updated, passed or major
      v1.get("/#{congress}/#{chamber}/bills/#{type}.json").parsed_response.results.first
    end

    def recent_by_member(id, type) # introduced or updated
      v1.get("/members/#{id}/bills/#{type}.json").parsed_response.results.first
    end

    def by_id(congress, id)
      v1.get("/#{congress}/bills/#{id}.json").parsed_response.results.first
    end

    def related(congress, id, type) # subjects, amendments or related
      v1.get("/#{congress}/bills/#{id}/#{type}.json").parsed_response.results.first
    end

    def cosponsors(congress, id)
      v1.get("/#{congress}/bills/#{id}/cosponsors.json").parsed_response.results.first
    end
  end
end