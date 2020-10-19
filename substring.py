
vowels = ['a', 'e', 'i', 'o', 'u']

def calculate(string):
    '''
        Method to Calculate no of substrings with alternate vowels and 
        consonants.
    '''
    string = string.lower()
    calulated_patterns = []
    no_of_possible_substrings = 0 
    count = 0
    
    for i in range(len(string)):
        if i < len(string) - 1:
            if (string[i] in vowels and string[i+1] in vowels) \
                or (string[i] not in vowels and string[i+1] not in vowels):
                calulated_patterns.append(count+1)
                count = 0
            else:
                count += 1
                if i == len(string) - 2:
                    calulated_patterns.append(count+1)
    for pattern in calulated_patterns:
        no_of_possible_substrings += (pattern*(pattern-1))/2

    return no_of_possible_substrings