# README

Experiment in modelling decision trees

See doc/initial-decision-tree.png for the initial decision tree being modeled

# Design Goals

* The decision tree is encapsulated in a single file which is easy to understand and modify
* Each step is contained in a single ERB template, easy to find and modify
* Adding new steps is straightforward

Provided these goals are acheived, I don't care if the code is a bit clunky

This experiment assumes the following;

* Steps form a tree (as opposed to a cyclic graph)
* Each step modifies one or more fields of an active record object, saving it as the users traverses each step
* Every step is uniquely identifiable. The templates underlying the steps can be re-used but if, for instance, you ask the user's age at two different points in the decision tree, that's two different steps (e.g. age1 and age2).

# Steps

For every step, you need a unique identifier. Assuming we have a step called 'age', you need to do the following;

* List the step in the config/routes.rb
* Create `app/controllers/steps/age_controller.rb`
* Create `app/views/steps/age/edit.html.erb`
* Fit your step into `app/services/decision_tree.rb`

For each of these steps, check the existing examples to see what should go into each of the above.

## Overriding the tree logic

You can pass a `next_step` parameter into each step to override the decision tree logic about
where to go after a given step. This can be used, for example, on a "check your answers" page (see `app/views/check_answers/edit.html.erb`)

