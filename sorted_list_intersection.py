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

test_variables = (
  (50000, 25000, 50000, 25000),
  (500000, 250000, 50000, 25000),
  (5000000, 2500000, 50000, 25000),
  (list_50m, _, 500, 250),
  (list_50m, _, 5000, 2500),
  (list_5om, _, 50000, 25000),
)


if __name__ == '__main__':
    import time, random
    list_50m = random.sample(range(35000000), 25000000)
    for a, a_choose, b, b_choose in test_variables:
        list_a = random.sample(range(a), a_choose) if a is not list_50m else list_50m
        set_a = set(list_a)
        sorted_a = sorted(list_a)
        list_b = random.sample(range(b), b_choose)
        hash_start = time.time()
        hash_res = set_a.intersection(list_b)
        hash_end = time.time()
        print "hash: list_a %d, list_b %d, res %d: time %f" % (len(list_a), len(list_b), len(hash_res), hash_end - hash_start)

        list_start = time.time()
        list_res = sorted_intersection(sorted_a, sorted(list_b))
        list_end = time.time()
        print "list: list_a %d, list_b %d, res %d: time %f" % (len(list_a), len(list_b), len(list_res), list_end - list_start)
        print '=' * 40

