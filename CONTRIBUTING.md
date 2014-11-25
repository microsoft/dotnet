# How to contribute

We welcome contributions! However, we do have some requests on how contributions
should be done. Please read them in order to avoid surprises down the road.

## Choosing something to work on

The issue tracker of each project has a list of items that you can start
working on:

* **Features**. Those are issues marked as 'enhancement'.

* **Bugs**. Those are issues marked as 'bug'.

In order to avoid overlap, it's always a good idea to comment on the item and
let everybody know that you want to work on it.

## Creating a pull request

1. Make sure that there is a corresponding issue for your change first. If there
   is none, create one.
2. Create a fork in GitHub
3. Create a branch off the `master` branch. Name it something that that makes
   sense, such as `issue-123` or `githubhandle-issue`. This makes it easy for everyone to figure out what
   the branch is used for. It also makes it easier to isolate your change from incoming changes from the origin.
4. Commit your changes and push your changes to GitHub
5. Create a pull request against the origin's `master` branch

## DOs and DON'Ts

* **DO** follow our coding style (see below)
* **DO** include tests when adding new features. When fixing bugs, start with
  adding a test that highlights how the current behavior is broken.
* **DO** keep the discussions focused. When a new or related topic comes up
  it's often better to create new issue than to side track the discussion.
* **DO** blog and tweet (or whatever) about your contributions, frequently!
* **DON'T** surprise us with big pull requests. Instead, file an issue and start
  a discussion so we can agree on a direction before you invest a large amount
  of time.
* **DON'T** commit code that you didn't write. If you find MIT or Apache 2 licensed code that you think is a good fit to add to .NET Core, file an issue and start a discussion before proceeding.


## C# Coding Style

The general rule we follow is "use Visual Studio defaults".

1. We use Allman style braces
2. We use four spaces of indentation (no tabs)
3. We use "_camelCase" private members and use "readonly" where possible
4. We avoid `this.` unless absolutely necessary
5. We always specify the visibility, even if it's the default (i.e.
   `private string _foo` not `string _foo`)
6. Namespace imports should be specified at the top of the file, *outside* of
   `namespace` declarations and should be sorted alphabetically, with `System.`
   namespaces at the top and blank lines between different top level groups

### Example File:

``ObservableLinkedList`1.cs:``

```C#
using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Diagnostics;

using Microsoft.Win32;

namespace System.Collections.Generic
{
    public partial class ObservableLinkedList<T> : INotifyCollectionChanged, INotifyPropertyChanged
    {
        private ObservableLinkedListNode<T> _head;
        private int _count;

        public ObservableLinkedList(IEnumerable<T> items)
        {
            if (items == null)
                throw new ArgumentException("items");

            foreach (T item in items)
            {
                AddLast(item);
            }
        }

        public event NotifyCollectionChangedEventHandler CollectionChanged;

        public int Count
        {
            get { return _count; }
        }

        public ObservableLinkedListNode AddLast(T value) 
        {
            LinkedListNode<T> newNode = new LinkedListNode<T>(this, value);

            InsertNodeBefore(_head, node);
        }

        protected virtual void OnCollectionChanged(NotifyCollectionChangedEventArgs e)
        {
            var handler = CollectionChanged;
            if (handler != null)
            {
                handler(this, e);
            }
        }

        private void InsertNodeBefore(LinkedListNode<T> node, LinkedListNode<T> newNode)
        {
           ...
        }
        
        ...
    }
}
```

``ObservableLinkedList`1.ObservableLinkedListNode.cs:``

```C#
using System;

namespace System.Collections.Generics
{
    partial class ObservableLinkedList<T>
    {
        public class ObservableLinkedListNode
        {
            private readonly ObservableLinkedList<T> _parent;
            private readonly T _value;

            internal ObservableLinkedListNode(ObservableLinkedList<T> parent, T value)
            {
                Debug.Assert(parent != null);

                _parent = parent;
                _value = value;
            }
            
            public T Value
            {
               get { return _value; }
            }
        }

        ...
    }
}
```
