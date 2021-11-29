my_dict = {'x':{'y':{'z':'a'}}}

my_dict.keys()

def vals(x)
    if isinstance(x, dict):
        result = []
        for v in x.values():
            result.extend(vals(v))
        return result
    else:
        return[x]

vals(my_dict)        