class DFA:
    def __init__(self, states, alphabet, transitions, initial_state, final_states):
        self.states = states
        self.alphabet = alphabet
        self.transitions = transitions
        self.initial_state = initial_state
        self.final_states = final_states
        self.current_state = initial_state

    def evaluate_expression(self, expression):
        for symbol in expression:
            self.current_state = self.transitions[self.current_state][symbol]

        if (self.current_state in self.final_states):
            return f'{expression} is Accepted'
        else:
            return f'{expression} is Rejected'


dfa = DFA(
    states=['q0', 'q1', 'q2'],
    initial_state='q0',
    final_states=['q0'],
    alphabet=['0', '1', '2'],
    transitions={
        'q0': {'0':  'q0', '1': 'q1', '2': 'q2'},
        'q1': {'0':  'q1', '1': 'q2', '2': 'q0'},
        'q2': {'0':  'q2', '1': 'q0', '2': 'q1'},
    }
)


print(dfa.evaluate_expression('011'))
print(dfa.evaluate_expression('1212'))
print(dfa.evaluate_expression('222'))
print(dfa.evaluate_expression('022'))
