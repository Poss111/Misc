from random import randint

class Element:
	def __init__(self, _name):
		self._name = _name
		
	def name(self):
		return _name
		
	def compareTo(self, Element):
		raise NotImplementedError("Not yet Implemented")
		
class Rock(Element):
	def __init__(self, _name):
		Element.__init__(self, _name)
		
	def compareTo(self, Element):
		if Element._name == self._name:
			return "Rock equals Rock", "Tie"
		elif Element._name == "Paper":
			return "Paper covers Rock", "Lose"
		elif Element._name == "Scissors":
			return "Rock crushes Scissors", "Win"
		elif Element._name == "Lizard":
			return "Rock crushes Lizard", "Win"
		elif Element._name == "Spock":
			return "Spock vaporizes Rock", "Lose"
		
class Paper(Element):
	def __init__(self, _name):
		Element.__init__(self, _name)
		
	def compareTo(self, Element):
		if Element._name == self._name:
			return "Paper equals Paper", "Tie"
		elif Element._name == "Rock":
			return "Paper covers Rock", "Win"
		elif Element._name == "Scissors":
			return "Scissors cut Paper", "Lose"
		elif Element._name == "Lizard":
			return "Lizard eats Paper", "Lose"
		elif Element._name == "Spock":
			return "Paper disproves Spock", "Win"

class Scissors(Element):
	def __init__(self, _name):
		Element.__init__(self, _name)
		
	def compareTo(self, Element):
		if Element._name == self._name:
			return "Scissors equals Scissors", "Tie"
		elif Element._name == "Rock":
			return "Rock crushes Scissors", "Lose"
		elif Element._name == "Paper":
			return "Scissors cut Paper", "Win"
		elif Element._name == "Lizard":
			return "Scissors decapitates Lizard", "Win"
		elif Element._name == "Spock":
			return "Spock smashes Scissors", "Lose"
			
class Lizard(Element):
	def __init__(self, _name):
		Element.__init__(self, _name)
		
	def compareTo(self, Element):
		if Element._name == self._name:
			return "Lizard equals Lizard", "Tie"
		elif Element._name == "Rock":
			return "Rock crushes Lizard", "Lose"
		elif Element._name == "Scissors":
			return "Scissors decapitates Lizard", "Lose"
		elif Element._name == "Paper":
			return "Lizard eats Paper", "Win"
		elif Element._name == "Spock":
			return "Lizard poisons Spock", "Win"

class Spock(Element):
	def __init__(self, _name):
		Element.__init__(self, _name)
		
	def compareTo(self, Element):
		if Element._name == self._name:
			return "Spock equals Spock", "Tie"
		elif Element._name == "Rock":
			return "Spock vaporizes Rock", "Win"
		elif Element._name == "Scissors":
			return "Spock smashes Scissors", "Win"
		elif Element._name == "Paper":
			return "Paper disproves Spock", "Lose"
		elif Element._name == "Lizard":
			return "Lizard poisons Spock", "Lose"

rock = Rock("Rock")
paper = Paper("Paper")
scissors = Scissors("Scissors")
lizard = Lizard("Lizard")
spock = Spock("Spock")

moves = []
moves.append(rock)
moves.append(paper)
moves.append(scissors)
moves.append(lizard)
moves.append(spock)

class Player:
	def __init__(self, _name):
		self._name = _name
		
	def name():
		return _name 
		
	def play():     
		raise NotImplementedError("Not yet implemented")
		
class StupidBot(Player):
	def __init__(self, _name):
		Player.__init__(self, _name)
		
		
	def play():
		return move[0]
		
class RandomBot(Player):
	def __init__(self, _name):
		Player.__init__(self, _name)
			
	def play():
		i = randint(0,4)
		return move[i]
		
class iterativeBot(Player):
	def __init__(self, _name):
		Player.__init__(self, _name)
			
	def play():
		raise NotImplementedError("Not yet implemented")
		