class Gossip
    attr_reader :author, :content
    def initialize(author, content)
        @content = content
        @author = author
    end

    def save
        file_path = "db/gossip.csv"

        CSV.open(file_path, "a") do |csv|
            csv << [@author, @content]
          end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line, id|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end

    def self.find

    end

end