module CongressApi
  class Members < V1
    def by_chamber(congress, chamber)
      v1.get("/#{congress}/#{chamber}/members.json").parsed_response.results.first.members
    end

    def by_id(id)
      v1.get("/members/#{id}.json").parsed_response.results.first
    end

    def new_members
      v1.get('/members/new.json').parsed_response.results.first
    end

    def senate_by_state(state)
      v1.get("/members/senate/#{state}/current.json").parsed_response.results
    end

    def house_by_district(state, district)
      v1.get("/members/house/#{state}/#{district}/current.json").parsed_response.results.first
    end

    def leaving(congress, chamber)
      v1.get("/#{congress}/#{chamber}/members/leaving.json").parsed_response.results
    end

    def votes(id)
      v1.get("/members/#{id}/votes.json").parsed_response.results
    end

    def compare_votes(congress, chamber, id1, id2)
      v1.get("/members/#{id1}/votes/#{id2}/#{congress}/#{chamber}.json").parsed_response.results
    end

    def bills(id, type)         # type is cosponsored or withdrawn
      v1.get("/members/#{id}/bills/#{type}.json").parsed_response.results.first.bills
    end

    def compare_bills(congress, chamber, id1, id2)
      v1.get("/members/#{id1}/bills/#{id2}/#{congress}/#{chamber}.json").parsed_response.results
    end
  end
end