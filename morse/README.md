## Translator Notes
This was an interesting exercise. File reading came into play:

```
file = File.open(input_file)
input =""
file.each do |line|
  input << line
end
```

Also, translating from morse to English was a challenge. Lessons:
* `split(' ')` will split on an entire run of whitespace. I ended up using `/\s` to split on a single whitespace character
* I can use `each_with_index {|item, index| block }` to `insert(index, item)` to insert while iterating.

Fun exercise.
