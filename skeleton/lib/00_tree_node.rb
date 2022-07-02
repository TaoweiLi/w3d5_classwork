class PolyTreeNode
    attr_accessor :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(parent_node)
        if @parent != nil
            @parent.children.delete(self)
        end

        @parent = parent_node

        if @parent != nil
            @parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
        
    end

    def remove_child(child_node)
        
        raise "error" if !@children.include?(child_node)

        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        return nil if self.children.length == 0

        self.children.each do |child|
           res = child.dfs(target_value)
            return res unless res.nil?
        end    
        nil
    end

    def bfs(target_value)

        queue = [self]
       
        while queue.length > 0
            queue += queue[0].children
            if queue[0].value == target_value
                return queue[0]
            else
                queue.shift()
            end
        end
        nil

    end

end



class KnightPathFinder

    attr_accessor :start_pos, :considered_pos

    def self.root_node
        root_node = PolyTreeNode.new(start_pos)
    end

    def self.valid_moves(pos)
        row = pos[0]
        col = pos[1]
        current_pos[row][col]
        shift_pos = [[1, 2], [2, 1], [2, -1], [1, -2],[-1, -2], [-2, -1], [-2, 1], [-1, 2]]
        new_pos = []
        shift_pos.each do |p|
            new_p = current_pos + p
            new_pos << new_p
        end
        
        return new_pos
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_pos = [start_pos]
    end

    def start_pos
        @start_pos
    end

    def new_move_positions(positions)
        new_pos = []
        positions.each do |pos|
        if considered_pos.valid_moves(pos) && !considered_pos.include?(pos)
            @considered_pos << pos
            new_pos <<pos
        end

        return new_pos
    end



    
    
end

k = KnightPathFinder.new([0,0])
p k