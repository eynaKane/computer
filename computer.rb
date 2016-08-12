class Computer
  @@users = { eyna: "123" }
  @@files = { "abc" => "123"}
  def initialize(username, password)
    @username = username
    @password = password
    check = @@users.select { |k, v| k == @username.to_sym && v == @password }
    if check != {}
      puts "Welcome back, #{@username}!\n\n"
      @valid = true
    else
      puts "Invalid account!\n\n"
      @valid = false
    end
  end

  def create(filename)
    return puts "File already exists!" unless @@files[filename] == nil
    time = Time.now
    @@files[filename] = time
    puts "\n#{filename.upcase} created by #{@username.upcase} (#{@password.upcase}) at #{time}\n\n"
  end

  def update(filename)
    return puts "Filename does not exist!" unless @@files[filename] != nil
    time = Time.now
    @@files[filename] = time
    puts "\n#{filename.upcase} updated by #{@username.upcase} (#{@password.upcase}) at #{time}\n\n"
  end

  def display

  end

  def delete(filename)

  end

  def Computer.get_users
    @@users
  end

  def Computer.get_files
    @@files
  end

  def user_valid?
    @valid
  end
end

print "Enter username: "
user = gets.chomp
print "Enter password: "
pw = gets.chomp

my_computer = Computer.new(user, pw)
if my_computer.user_valid?
  loop do
    print "\n**********\nChoices:\n Create\n Update\n Display \n Delete\n\nPlease enter your choice: "
    choice = gets.chomp.strip.downcase

    case choice
    when "create"
      print "Enter filename: "
      file = gets.chomp
      if file != ""
        my_computer.create(file)
      else
        puts "INVALID FILE!\n\n"
      end
    when "update"
      print "Enter filename: "
      file = gets.chomp
      if file != ""
        my_computer.update(file)
      else
        puts "INVALID FILE!\n\n"
      end
    end
    print "\nTry again? "
  try = gets.chomp
  break if try !~ /^y{1}(es)?$/i
  end
end
print "\n#{Computer.get_users}"
print "\n#{Computer.get_files}"


