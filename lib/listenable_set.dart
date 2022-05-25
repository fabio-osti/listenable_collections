library listenable_set;
import 'package:flutter/foundation.dart';

class ListenableSet<E> implements Set<E>, Listenable {
  final Set<E> _set;
  final Set<VoidCallback> _callbacks = {};

  ListenableSet()
      : _set = {};
  ListenableSet.from(Iterable elements)
      : _set = Set.from(elements);
  ListenableSet.identity() : _set = Set.identity();
  ListenableSet.of(Iterable<E> elements) : _set = Set.of(elements);

  @override
  int get length => _set.length;

  @override
  void addAll(Iterable<E> iterable) {
    _set.addAll(iterable);
    _notifyListChanged();
  }

  @override
  bool remove(Object? element) {
    final removed = _set.remove(element);
    _notifyListChanged();
    return removed;
  }

  _notifyListChanged() {
    for (var callback in _callbacks) {
      callback();
    }
  }

  @override
  addListener(VoidCallback listener) {
    _callbacks.add(listener);
  }

  @override
  removeListener(VoidCallback listener) {
    _callbacks.remove(listener);
  }

  @override
  bool any(bool Function(E element) test) {
    return _set.any(test);
  }

  @override
  Set<R> cast<R>() {
    return _set.cast<R>();
  }

  @override
  bool contains(Object? element) {
    return _set.contains(element);
  }

  @override
  E elementAt(int index) {
    return _set.elementAt(index);
  }

  @override
  bool every(bool Function(E element) test) {
    return _set.every(test);
  }

  @override
  Iterable<ExT> expand<ExT>(Iterable<ExT> Function(E element) toElements) {
    return _set.expand(toElements);
  }

  @override
  E get first => _set.first;

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) {
    return _set.firstWhere(test, orElse: orElse);
  }

  @override
  FoldT fold<FoldT>(FoldT initialValue,
      FoldT Function(FoldT previousValue, E element) combine) {
    return _set.fold(initialValue, combine);
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) {
    return _set.followedBy(other);
  }

  @override
  void forEach(void Function(E element) action) {
    _set.forEach(action);
  }

  @override
  bool get isEmpty => _set.isEmpty;

  @override
  bool get isNotEmpty => _set.isNotEmpty;

  @override
  Iterator<E> get iterator => _set.iterator;

  @override
  String join([String separator = ""]) {
    return _set.join(separator);
  }

  @override
  E get last => _set.last;

  @override
  E lastWhere(bool Function(E) test, {E Function()? orElse}) {
    return _set.lastWhere(test, orElse: orElse);
  }

  @override
  Iterable<T> map<T>(T Function(E) toElement) {
    return _set.map(toElement);
  }

  @override
  E reduce(E Function(E value, E element) combine) {
    return _set.reduce(combine);
  }

  @override
  E get single => _set.single;

  @override
  E singleWhere(bool Function(E element) test,
      {E Function()? orElse}) {
    return _set.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> skip(int count) {
    return _set.skip(count);
  }

  @override
  Iterable<E> skipWhile(bool Function(E value) test) {
    return _set.skipWhile(test);
  }

  @override
  Iterable<E> take(int count) {
    return _set.take(count);
  }

  @override
  Iterable<E> takeWhile(bool Function(E value) test) {
    return _set.takeWhile(test);
  }

  @override
  List<E> toList({bool growable = true}) {
    return _set.toList(growable: growable);
  }

  @override
  Set<E> toSet() {
    return _set.toSet();
  }

  @override
  Iterable<E> where(bool Function(E element) test) {
    return _set.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return _set.whereType<T>();
  }

  @override
  void clear() {
    _set.clear();
    _notifyListChanged();
  }

  @override
  void removeWhere(bool Function(E element) test) {
    _set.removeWhere(test);
    _notifyListChanged();
  }

  @override
  void retainWhere(bool Function(E element) test) {
    _set.retainWhere(test);
    _notifyListChanged();
  }
  
  @override
  bool add(E value) {
    final added = _set.add(value);
    _notifyListChanged();
    return added;
  }
  
  @override
  bool containsAll(Iterable<Object?> other) {
    return _set.containsAll(other);
  }
  
  @override
  Set<E> difference(Set<Object?> other) {
    return _set.difference(other);
  }
  
  @override
  Set<E> intersection(Set<Object?> other) {
    return _set.intersection(other);
  }
  
  @override
  E? lookup(Object? object) {
    return _set.lookup(object);
  }
  
  @override
  void removeAll(Iterable<Object?> elements) {
    _set.removeAll(elements);
    _notifyListChanged();
  }
  
  @override
  void retainAll(Iterable<Object?> elements) {
    _set.retainAll(elements);
    _notifyListChanged();
  }
  
  @override
  Set<E> union(Set<E> other) {
    return _set.union(other);
  }
}