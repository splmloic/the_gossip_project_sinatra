class Gossip
    attr_accessor :author, :content
    def initialize(author, content)
        @content = content
        @author = author
    end

    def save
        CSV.open("db/gossip.csv", "a") do |csv|
            csv << [@author, @content]
          end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end

    def self.find(id)
        #on cible la bonne ligne et on la renvoie
        all_gossips = self.all
        gossip = all_gossips[id.to_i]
        return gossip
    end

    def update(id,author,content)
        #j'aimerai récuperer l'id du gossip pour lui fouttre des nouvelles string dedans
        all_gossips = Gossip.all
        CSV.open("db/gossip.csv", "w") do |csv| #w pour tout effacer er réécrire
            all_gossips.each_with_index do |gossip, index|
                if index == id
                    # Mettre à jour la ligne choisi
                    csv << [author,content]
                else 
                    #remplir comme avant le csv
                    csv << [all_gossips[index].author, all_gossips[index].content]
                end
            end
        end
    end

end