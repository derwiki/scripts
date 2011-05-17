def sorted_intersection(list_a, list_b):
  intersection = []
  try:
    i = j = 0
    while 1:
      i += 1 if list_a[i] < list_b[j] else 0
      j += 1 if list_a[i] > list_b[j] else 0
      if list_a[i] == list_b[j]:
        intersection.append(list_a[i])
        i += 1; j += 1
  except IndexError:
    return intersection

if __name__ == '__main__':
    list_a = range(10)
    list_b = range(1, 15, 2)
    print list_a
    print list_b
    print sorted_intersection(list_a, list_b)
