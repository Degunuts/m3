def load_file(file):
    data = open(file, 'r')
    DNA = data.read()
    DNA_list = DNA.split('\n')
    return DNA_list


def assemble_genome2(dna_list):
    string = dna_list[0]
    dna_list.remove(string)
    while len(dna_list)>1:
        x=0
        y=0
        for i in dna_list:
            if x == 1 or y == 1:
                continue
            if string[0:8] == i[-8:]: #checking prefix of string against suffix of i
                dna_list.remove(i)
                suf = i.replace(i[-8:],'')
                string = suf+string
                x=1
                continue
            if string[-8:] == i[0:8]: #suffix vs prefix
                dna_list.remove(i)
                pref = i.replace(i[0:8],'')
                string = string + pref
                y=1
                continue
    return string

