import random

_GEN_VERBOSE = False


def file2list(filename: str):
    return [line.strip() for line in open(filename, 'r')]


def generateNames(personel_type: chr, number: int):
    """Generates names from files. Returns a list"""

    if personel_type == 'e':
        # gnerate employees
        first_names = file2list(
            'first_names_f_e.txt') + file2list('first_names_m_e.txt')
        last_names = file2list('last_names.txt')

        if _GEN_VERBOSE:
            print('first names:', first_names)
            print('last names:', last_names)

        employees = [random.choice(first_names) + ' ' +
                     random.choice(last_names) for _ in range(number)]

        if _GEN_VERBOSE:
            print(employees)

        return employees


# test
emps = generateNames('e', 5)
for e in emps:
    print('(\'' + e + '\')')
