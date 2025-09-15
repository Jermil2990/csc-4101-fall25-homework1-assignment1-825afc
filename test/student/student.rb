require "minitest/autorun"
require_relative "../../src/warmup.rb"
require_relative "../../src/phonebook.rb"

class StudentTests < Minitest::Test
  def setup
    @phonebook = PhoneBook.new
  end

  def test_student_fib
    assert_equal([0, 1], fib(2))
    assert_equal([0, 1, 1, 2, 3, 5, 8, 13, 21], fib(9))
  end

  def test_student_ispalindrome
    assert_equal(false, isPalindrome(12))
    assert_equal(true, isPalindrome(1221))
    assert_equal(false, isPalindrome(123221))
  end

  def test_student_nthmax
    assert_equal(1, nthmax(3, [4, 3, 2, 1, 0]))
    assert_nil(nthmax(4, [1, 2, 3]))
    assert_equal(5, nthmax(0, [5, 5, 5, 5]))
  end
  def test_student_freq
    assert_equal("c", freq("cccvvbbfffdcc"))
    assert_equal("h", freq("himothy"))
    assert_equal("2", freq("11223sadaa22"))
  end

  def test_student_ziphash
    assert_equal({1 => 2, 3 => 4, 5 => 6}, zipHash([1, 3, 5], [2, 4, 6]))
    assert_equal({"Ashley" => 1, "Bob" => 2}, zipHash(["Ashley", "Bob"], [1, 2]))
    assert_nil(zipHash([], [12]))
  end

  def test_student_hashtoarray
    assert_equal([["key1", "value1"], ["key2", "value2"]], hashToArray({"key1" => "value1", "key2" => "value2"}))
    assert_equal([["x", 10], ["y", 20], ["z", 30]], hashToArray({"x" => 10, "y" => 20, "z" => 30}))
  end

  def test_student_phonebook_add
    assert_equal(true, @phonebook.add("Mary", "123-456-7890", false))
    assert_equal(true, @phonebook.add("Bob", "987-654-3210", false))
    assert_equal(false, @phonebook.add("Mary", "123-456-7890", false))
  end

  def test_student_phonebook_lookup
    @phonebook.add("Ricky", "555-555-5555", false)
    assert_nil(@phonebook.lookup("Ricky"))
    assert_nil(@phonebook.lookup("NonExistent"))
  end

  def test_student_phonebook_lookup_by_num
    @phonebook.add("Dave", "444-444-4444", false)
    assert_nil(@phonebook.lookupByNum("444-444-4444"))
    assert_nil(@phonebook.lookupByNum("000-000-0000"))
  end

  def test_student_phonebook_lookup_by_ac
    @phonebook.add("Jill", "333-123-4567", false)
    @phonebook.add("Richard", "333-987-6543", false)
    assert_equal(["Jill", "Richard"], @phonebook.namesByAc("333").sort)
    assert_equal([], @phonebook.namesByAc("999"))
  end
end