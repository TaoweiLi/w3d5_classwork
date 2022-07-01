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

