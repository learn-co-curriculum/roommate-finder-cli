class RoomScraper

  def initialize(index_url)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
  end

  def call
    rows.each do |row_doc|
      Room.create_from_hash(scrape_row(row_doc)) #=> Should put the room in my database.
    end
  end

  private
    def rows
      @rows ||= @doc.search("div.content span.rows p.row")
    end

    def scrape_row(row)
      # scrape an individual row
      {
        :date_created => row.search("time").attribute("datetime").text,
        :title => row.search("a.hdrlnk").text,
        :url => "#{@index_url}#{row.search("a.hdrlnk").attribute("href").text}",
        :price => row.search("span.price").text,
      }
    end

end
