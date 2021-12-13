require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = rooms.transform_values { |v| Room.new(v) }
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def check_in(guest, room)
    unless self.room_exists?(room)
      puts "sorry, room does not exist"
      return
    end

    success = @rooms[room].add_occupant(guest)
    if success
      puts "check in successful"
    else
      puts "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.any? { |_, room| !room.full? }
  end

  def list_rooms
    @rooms.each do |room_name, room_info|
      puts "#{room_name}: #{room_info.available_space}"
    end
  end
end
