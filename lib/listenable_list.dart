library listenable_list;
import 'package:flutter/foundation.dart';
import 'dart:math';

class ListenableList<E> implements List<E>, Listenable {
  final List<E> _list;
  final Set<VoidCallback> _callbacks = {};

  ListenableList([bool growable = true])
      : _list = List.empty(growable: growable);
  ListenableList.from(Iterable<E> elements, [bool growable = true])
      : _list = List.from(elements);

  @override
  E operator [](int index) => _list[index];

  @override
  operator []=(int index, E value) {
    _list[index] = value;
    _notifyListChanged();
  }

  @override
  shuffle([Random? random]) {
    _list.shuffle(random);
    _notifyListChanged();
  }

  @override
  int get length => _list.length;

  @override
  set length(int newLength) {
    _notifyListChanged();
    _list.length = newLength;
  }

  @override
  void add(E element) {
    _list.add(element);
    _notifyListChanged();
  }

  @override
  void addAll(Iterable<E> iterable) {
    _list.addAll(iterable);
    _notifyListChanged();
  }

  @override
  bool remove(Object? element) {
    final removed = _list.remove(element);
    _notifyListChanged();
    return removed;
  }

  @override
  E removeAt(int index) {
    final removed = _list.removeAt(index);
    _notifyListChanged();
    return removed;
  }

  @override
  E removeLast() {
    final removed = _list.removeLast();
    _notifyListChanged();
    return removed;
  }

  @override
  sort([int Function(E, E)? compare]) {
    _list.sort(compare);
    _notifyListChanged();
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
    return _list.any(test);
  }

  @override
  List<R> cast<R>() {
    return _list.cast<R>();
  }

  @override
  bool contains(Object? element) {
    return _list.contains(element);
  }

  @override
  E elementAt(int index) {
    return _list.elementAt(index);
  }

  @override
  bool every(bool Function(E element) test) {
    return _list.every(test);
  }

  @override
  Iterable<ExT> expand<ExT>(Iterable<ExT> Function(E element) toElements) {
    return _list.expand(toElements);
  }

  @override
  E get first => _list.first;

  @override
  E firstWhere(bool Function(E element) test, {E Function()? orElse}) {
    return _list.firstWhere(test, orElse: orElse);
  }

  @override
  FoldT fold<FoldT>(FoldT initialValue,
      FoldT Function(FoldT previousValue, E element) combine) {
    return _list.fold(initialValue, combine);
  }

  @override
  Iterable<E> followedBy(Iterable<E> other) {
    return _list.followedBy(other);
  }

  @override
  void forEach(void Function(E element) action) {
    _list.forEach(action);
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  Iterator<E> get iterator => _list.iterator;

  @override
  String join([String separator = ""]) {
    return _list.join(separator);
  }

  @override
  E get last => _list.last;

  @override
  E lastWhere(bool Function(E) test, {E Function()? orElse}) {
    return _list.lastWhere(test, orElse: orElse);
  }

  @override
  Iterable<T> map<T>(T Function(E) toElement) {
    return _list.map(toElement);
  }

  @override
  E reduce(E Function(E value, E element) combine) {
    return _list.reduce(combine);
  }

  @override
  E get single => _list.single;

  @override
  E singleWhere(bool Function(E element) test,
      {E Function()? orElse}) {
    return _list.singleWhere(test, orElse: orElse);
  }

  @override
  Iterable<E> skip(int count) {
    return _list.skip(count);
  }

  @override
  Iterable<E> skipWhile(bool Function(E value) test) {
    return _list.skipWhile(test);
  }

  @override
  Iterable<E> take(int count) {
    return _list.take(count);
  }

  @override
  Iterable<E> takeWhile(bool Function(E value) test) {
    return _list.takeWhile(test);
  }

  @override
  List<E> toList({bool growable = true}) {
    return _list.toList(growable: growable);
  }

  @override
  Set<E> toSet() {
    return _list.toSet();
  }

  @override
  Iterable<E> where(bool Function(E element) test) {
    return _list.where(test);
  }

  @override
  Iterable<T> whereType<T>() {
    return _list.whereType<T>();
  }

  @override
  List<E> operator +(List<E> other) {
    return _list + other;
  }

  @override
  Map<int, E> asMap() {
    return _list.asMap();
  }

  @override
  void clear() {
    _list.clear();
    _notifyListChanged();
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    _list.fillRange(start, end, fillValue);
    _notifyListChanged();
  }

  @override
  set first(E value) {
    _list.first = value;
    _notifyListChanged();
  }

  @override
  Iterable<E> getRange(int start, int end) {
    return _list.getRange(start, end);
  }

  @override
  int indexOf(E element, [int start = 0]) {
    return _list.indexOf(element, start);
  }

  @override
  int indexWhere(bool Function(E element) test, [int start = 0]) {
    return _list.indexWhere(test, start);
  }

  @override
  void insert(int index, E element) {
    _list.insert(index, element);
    _notifyListChanged();
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    _list.insertAll(index, iterable);
    _notifyListChanged();
  }

  @override
  set last(E value) {
    _list.last = value;
    _notifyListChanged();
  }

  @override
  int lastIndexOf(E element, [int? start]) {
    return _list.lastIndexOf(element, start);
  }

  @override
  int lastIndexWhere(bool Function(E element) test, [int? start]) {
    return _list.lastIndexWhere(test, start);
  }

  @override
  void removeRange(int start, int end) {
    _list.removeRange(start, end);
    _notifyListChanged();
  }

  @override
  void removeWhere(bool Function(E element) test) {
    _list.removeWhere(test);
    _notifyListChanged();
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    _list.replaceRange(start, end, replacements);
    _notifyListChanged();
  }

  @override
  void retainWhere(bool Function(E element) test) {
    _list.retainWhere(test);
    _notifyListChanged();
  }

  @override
  Iterable<E> get reversed => _list.reversed;

  @override
  void setAll(int index, Iterable<E> iterable) {
    _list.setAll(index, iterable);
    _notifyListChanged();
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable,
      [int skipCount = 0]) {
    _list.setRange(start, end, iterable, skipCount);
    _notifyListChanged();
  }

  @override
  List<E> sublist(int start, [int? end]) {
    return _list.sublist(start, end);
  }
}
