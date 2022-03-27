class Game < ApplicationRecord
  
  # TODO: add validations for emojis & answers

  # 100 emojis that can be eaten
  EDIBLES = [
    "🍇", "🍉", "🍊", "🍋", "🍌", "🍍", "🥭", "🍎", "🍐", "🍑", "🍒", "🍓", "🫐", "🥝", "🍅", "🫒", "🥥", "🥑", "🍆", "🥔", "🥕", "🌽", "🫑", "🥒", "🥬", "🥦", "🧄", "🧅", "🍄", "🥜", "🌰", "🍞", "🥐", "🥖", "🫓", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍲", "🫕", "🥗", "🍿", "🧈", "🧂", "🥫", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍝", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡", "🥟", "🥠", "🥡", "🦪", "🍦", "🍧", "🍨", "🍩", "🍪", "🍰", "🧁", "🥧", "🍫", "🍬", "🍭", "🍮", "🍯", "🥛", "☕", "🍵", "🧋", "🧃", "🧉", "🧊"
  ].freeze
  
  # 100 emojis you can't eat
  INEDIBLES = [
    "💌", "💣", "🔪", "🏺", "🧭", "🧱", "💈", "🧳", "⏳", "⏰", "🧨", "🎈", "🎉", "🧧", "🎀", "🎁", "🤿", "🪁", "🔮", "🪄", "🧿", "🧸", "🪅", "🪆", "🧵", "🧶", "📿", "💎", "📯", "📻", "🪕", "📱", "📟", "🔋", "💻", "💾", "📀", "🧮", "🎥", "📺", "📷", "📹", "📼", "🔍", "💡", "🔦", "🏮", "🪔", "📔", "📚", "📓", "💰", "💵", "💳", "📦", "📅", "📌", "📎", "🔑", "🔨", "🪓", "🪃", "🪚", "🔧", "🔩", "🔗", "🪝", "🧰", "🧲", "🪜", "🔬", "🔭", "📡", "💊", "🪑", "🚽", "🪠", "🛁", "🪒", "🧴", "🧹", "🧺", "🧻", "🪣", "🧼", "🪥", "🧽", "🧯", "🗿", "🏀", "🏈", "🛼", "🎮", "🎲", "🚗", "🚀", "🚁", "🛶", "🛸", "🛵"
  ].freeze
  
  # Sets up new game board of 30 edible/inedible emojis and creates a true/false string of answers
  def new_game_set!
    emojis = ""
    answers = ""
    
    # Choose 30 random emojis from the 200 objects and create true/false string of whether each is edible
    (0...30).each do
      item = rand(0..1)
      if item == 0
        emojis << INEDIBLES.sample
        answers << "0"
      else
        emojis << EDIBLES.sample
        answers << "1"
      end
    end
    
    # Update object with new game set
    self.emojis = emojis
    self.answers = answers
    self.responses = ""
  end

end
