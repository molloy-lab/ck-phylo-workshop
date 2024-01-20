"""
This file contains wrapper functions for treeswift module
"""
import random
import sys
import treeswift

sys.setrecursionlimit(10**6)

def randomly_refine_helper(node):
    """
    Parameters
    ----------
    node : treeswift Node object

    Returns:
    --------
    Nothing, refines node so it only has 2 children
    """
    if node.is_leaf():
        return

    children = node.child_nodes()
    while len(children) > 2:
        # Pick two children at random
        random.shuffle(children)
        child1 = children[0]
        child2 = children[1]

        # Detach children from node
        node.remove_child(child1)
        node.remove_child(child2)

        # Create new node
        new_node = treeswift.Node()
        #new_node.set_edge_length(0.0)
        #new_node.set_label("0")

        # Attach children to new node
        new_node.add_child(child1)
        new_node.add_child(child2)

        # Attach new node to node
        node.add_child(new_node)

        # Update list of children
        children = node.child_nodes()

def randomly_refine(tree, seed):
    """
    Parameters
    ----------
    tree : treeswift Tree object
    seed : seed value for random number generator

    Returns
    -------
    Nothing, refines tree
    """
    random.seed(seed)
    for node in tree.traverse_postorder():
        randomly_refine_helper(node)

def newick_helper(node, do_edge_length, do_internal_label):
    """
    Parameters
    ----------
    node : treeswift Node object
    do_edge_length : boolean
    do_internal_label : boolean

    Returns
    -------
    newick string for subtree below node
    """
    if node.is_leaf():
        if node.label is not None:
            return str(node.label)
        else:
            return ""

    out = '('
    for child in node.children:
        out += newick_helper(child, do_edge_length, do_internal_label)

        elen = child.edge_length
        if (do_edge_length) and (elen is not None):
            if isinstance(elen, int):
                out += str(':%d' % elen)
            elif isinstance(elen, float):
                out += str(':%1.10f' % elen)
            else:
                out += str(':%s' % str(elen))

        out += ','

    out = out[:-1] + ')'  # Drop trailing comma

    if (do_internal_label) and (node.label is not None):
        out += str(node.label)

    return out


def newick(tree, do_edge_length=True, do_internal_label=True):
    """
    Parameters
    ----------
    tree : treeswift Tree object

    Returns
    -------
    newick string for tree
    """
    suffix = ''
    elen = tree.root.edge_length
    if elen is not None:
        if isinstance(elen, int):
            suffix += str(':%d' % elen)
        elif isinstance(elen, float):
            suffix += str(':%1.10f' % elen)
        else:
            suffix += str(':%s' % str(elen))
    suffix += ';'

    prefix = newick_helper(tree.root, do_edge_length, do_internal_label)

    return '%s%s' % (prefix, suffix)

