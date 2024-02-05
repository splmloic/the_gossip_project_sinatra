class Gossip

    def save
        file_path = "db/gossip.csv"

        CSV.open(file_path, "a") do |csv|
            csv << ["lol", "mdr"]
          end
    end
end