import random

_GEN_VERBOSE = False


def file2list(filename: str):
    return [line.strip() for line in open(filename, 'r')]


def generateNames(personel_type: chr, number: int):
    """Generates names from files. Returns a list"""

    if personel_type == 'e':
        # generate employees
        first_names = file2list(
            'first_names_f_e.txt') + file2list('first_names_m_e.txt')
    elif personel_type == 'c':
        # generate customers
        first_names = file2list(
            'first_names_f_c.txt') + file2list('first_names_m_c.txt')
    else:
        return list()

    last_names = file2list('last_names.txt')

    if _GEN_VERBOSE:
        print('first names:', first_names)
        print('last names:', last_names)

    names = [random.choice(first_names) + ' ' +
             random.choice(last_names) for _ in range(number)]

    if _GEN_VERBOSE:
        print(names)

    return names


# # # test
# for e in generateNames('e', 2):
#     print(e)
# for c in generateNames('c', 2):
#     print(c)


def generateSQL_employees(number: int, departments: int):
    """Generates ready-to-paste rows of employees, returned in a list"""

    employeesSQL = generateNames('e', number)

    # add opening partnthesis and 's between strings
    employeesSQL = ['(\'' + e + '\'' for e in employeesSQL]

    # add department number
    employeesSQL = [e + ', ' + str(random.randint(1, departments))
                    for e in employeesSQL]

    # add closing partnthesis
    employeesSQL = [e + ')' for e in employeesSQL]
    return employeesSQL


for e in generateSQL_employees(10, 3):
    print(',', e)
