#!/usr/bin/env python

import sys

country_lenght = {
        'AL': 28, 'AD': 24, 'AT': 20, 'AZ': 28,
        'BE': 16, 'BH': 22, 'BA': 20, 'CR': 21,
        'HR': 21, 'CY': 28, 'CZ': 24, 'DK': 18,
        'DO': 28, 'EE': 20, 'FO': 18, 'FI': 18,
        'FR': 27, 'GE': 22, 'DE': 22, 'GI': 23,
        'GR': 27, 'GL': 18, 'GT': 28, 'HU': 28,
        'IS': 26, 'IE': 22, 'IL': 23, 'IT': 27,
        'KZ': 22, 'KW': 30, 'LV': 21, 'LB': 28,
        'LI': 21, 'LT': 20, 'LU': 20, 'MK': 19,
        'MT': 31, 'MR': 27, 'MU': 30, 'MC': 27,
        'MD': 24, 'ME': 22, 'NL': 18, 'NO': 15,
        'PK': 24, 'PS': 29, 'PL': 28, 'PT': 25,
        'RO': 24, 'SM': 27, 'SA': 24, 'RS': 22,
        'SK': 24, 'SI': 19, 'ES': 24, 'SE': 24,
        'CH': 21, 'TN': 24, 'TR': 26, 'AE': 23,
        'GB': 22, 'VG': 24
}

def validate(iban):
    country = iban[0:2]
    print "country = %s" % country
    if country in country_lenght.keys():
        if country_lenght[country] == len(iban):
            l1 = ord(country[0].lower()) - 87
            l2 = ord(country[1].lower()) - 87
            D = iban[4:] + str(l1) + str(l2) + iban[2:4]
            print "D = %s" % D
            remainder = int(D) % 97
            print "remainder = %s" % remainder
            if remainder == 1:
                return True
            else:
                return False
        else:
            print "invalid length"
            return False
    else:
        print "invalid country"
        return False
    

if __name__ == '__main__':
    if validate(sys.argv[1]):
        print "valid"
    else:
        print "invalid"


