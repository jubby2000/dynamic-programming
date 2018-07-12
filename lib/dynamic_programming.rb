require 'byebug'

class DynamicProgramming

  def initialize
    # @blair_cache = { 1=>1, 2=>2 }
    @frog_cache = { 1=>[[1]], 2=>[[1,1], [2]], 3=>[[1,1,1], [1,2], [2,1], [3]] }
    @super_frog_cache = { 0=>[[]] }
  end

  def build_blair_cache(n)
    cache = { 1=>1, 2=>2 }
    return cache if n < 3
    (3..n).each do |i|
      odd = ((2 * (i - 1)) - 1)
      cache[i] = cache[i - 1] + cache[i - 2] + odd
    end
    cache
  end

  def blair_nums(n)
    cache = build_blair_cache(n)
    cache[n]
    # return @blair_cache[n] if @blair_cache[n]
    # odd = ((2 * (n - 1)) - 1)
    # ans = blair_nums(n - 1) + blair_nums(n - 2) + odd
    # @blair_cache[n] = ans
    # ans
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1=>[[1]], 2=>[[1,1], [2]], 3=>[[1,1,1], [1,2], [2,1], [3]] }
    return cache if n < 4
    (4..n).each do |i|
      onePrevious = cache[i - 1].map { |el| [1] + el }
      twoPrevious = cache[i - 2].map { |el| [2] + el }
      threePrevious = cache[i - 3].map { |el| [3] + el }
      cache[i] = onePrevious + twoPrevious + threePrevious
    end
    return cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] if @frog_cache[n]
    onePrevious = frog_hops_top_down_helper(n - 1).map { |el| [1] + el }
    twoPrevious = frog_hops_top_down_helper(n - 2).map { |el| [2] + el }
    threePrevious = frog_hops_top_down_helper(n - 3).map { |el| [3] + el }
    @frog_cache[n] = threePrevious + twoPrevious + onePrevious
    return threePrevious + twoPrevious + onePrevious
  end

  def super_frog_hops(n, k)
    super_frog_cache_builder(n, k)
    @super_frog_cache[n]
  end

  def super_frog_cache_builder(maxStairs, maxJump)
    return @super_frog_cache if maxJump < 1 || maxStairs < 1
    debugger
    (1..maxJump).each do |i|
      # maxJump.downto(1)
      i.downto(0).each do |j|
        @super_frog_cache[i] += @super_frog_cache[j]
      end
    end
    
    return cache
  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
