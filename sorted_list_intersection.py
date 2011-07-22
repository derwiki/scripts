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
    import time, random
    word_set = set(line.strip() for line in open('word.list'))
    print "Dictionary size: %d" % len(word_set)
    word_list = tuple(word_set)
    sorted_word_list = sorted(word_set)

    subsets = (500, 1000, 20000, 50000, 100000, 200000, len(word_set))
    for subset_size in subsets:
        subset = sorted(random.sample(word_list, subset_size))
        with open('sample_%d.list' % subset_size, 'w') as sample_file:
            for word in sorted(tuple(subset)):
                sample_file.write("%s\n" % word)

        hash_start = time.time()
        hash_res = word_set.intersection(subset)
        hash_end = time.time()
        print "hash: word_list %d, subset %d, res %d: time %f" % (len(word_list), len(subset), len(hash_res), hash_end - hash_start)

        list_start = time.time()
        list_res = sorted_intersection(sorted_word_list, subset)
        list_end = time.time()
        print "list: word_list %d, subset %d, res %d: time %f" % (len(word_list), len(subset), len(list_res), list_end - list_start)
        print '=' * 40

