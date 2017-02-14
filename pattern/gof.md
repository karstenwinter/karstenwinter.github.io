## Gang of Four Patterns

The following description is taken from [Wikipedia](https://en.wikipedia.org/wiki/Design_Patterns). You can find a simple implementation for each one in Ruby. You may execute them in your IDE or [here](../index.html).

### Creational

Creational patterns are ones that create objects for you, rather than having you instantiate objects directly.

This gives your program more flexibility in deciding which objects need to be created for a given case.

[Abstract factory](gof/abstractfactory.rb) pattern groups object factories that have a common theme.

[Builder](gof/builder.rb) pattern constructs complex objects by separating construction and representation.

[Factory method](gof/factorymethod.rb) pattern creates objects without specifying the exact class to create.

[Prototype](gof/prototype.rb) pattern creates objects by cloning an existing object.

[Singleton](gof/singleton.rb) pattern restricts object creation for a class to only one instance.

### Structural

These concern class and object composition.

They use inheritance to compose interfaces and define ways to compose objects to obtain new functionality.

[Adapter](gof/adapter.rb) allows classes with incompatible interfaces to work together by wrapping its own interface around that of an already existing class.

[Bridge](gof/bridge.rb) decouples an abstraction from its implementation so that the two can vary independently.

[Composite](gof/composite.rb) composes zero-or-more similar objects so that they can be manipulated as one object.

[Decorator](gof/decorator.rb) dynamically adds/overrides behaviour in an existing method of an object.

[Facade](gof/facade.rb) provides a simplified interface to a large body of code.

[Flyweight](gof/flyweight.rb) reduces the cost of creating and manipulating a large number of similar objects.

[Proxy](gof/proxy.rb) provides a placeholder for another object to control access, reduce cost, and reduce complexity.

### Behavioral

Most of these design patterns are specifically concerned with communication between objects.

[Chain of responsibility](gof/chainofresponsibility.rb) delegates commands to a chain of processing objects.

[Command](gof/command.rb) creates objects which encapsulate actions and parameters.

[Interpreter](gof/interpreter.rb) implements a specialized language.

[Iterator](gof/iterator.rb) accesses the elements of an object sequentially without exposing its underlying representation.

[Mediator](gof/mediator.rb) allows loose coupling between classes by being the only class that has detailed knowledge of their methods.

[Memento](gof/memento.rb) provides the ability to restore an object to its previous state (undo).

[Observer](gof/observer.rb) is a publish/subscribe pattern which allows a number of observer objects to see an event.

[State](gof/state.rb) allows an object to alter its behavior when its internal state changes.

[Strategy](gof/strategy.rb) allows one of a family of algorithms to be selected on-the-fly at runtime.

[Template method](gof/templatemethod.rb) defines the skeleton of an algorithm as an abstract class, allowing its subclasses to provide concrete  behavior.

[Visitor](gof/visitor.rb) separates an algorithm from an object structure by moving the hierarchy of methods into one object.
