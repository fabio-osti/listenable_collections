library listenable_map;
import 'package:flutter/foundation.dart';

class ListenableMap<K, V> implements Map<K, V>, Listenable {
  final Map<K, V> _map;
  final Set<VoidCallback> _callbacks = {};

  ListenableMap()
      : _map = {};
  ListenableMap.from(Map other)
      : _map = Map.from(other);
  ListenableMap.identity() : _map = Map.identity();
  ListenableMap.of(Map<K,V> other) : _map = Map.of(other);

  @override
  int get length => _map.length;

  @override
  void addAll(Map<K,V> other) {
    _map.addAll(other);
    _notifyMapChanged();
  }

  @override
  V? remove(Object? element) {
    final removed = _map.remove(element);
    _notifyMapChanged();
    return removed;
  }

  _notifyMapChanged() {
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
  Map<RK,VK> cast<RK,VK>() {
    return _map.cast<RK,VK>();
  }

  @override
  void forEach(void Function(K,V) action) {
    _map.forEach(action);
  }

  @override
  bool get isEmpty => _map.isEmpty;

  @override
  bool get isNotEmpty => _map.isNotEmpty;
  @override
  void clear() {
    _map.clear();
    _notifyMapChanged();
  }

  @override
  void removeWhere(bool Function(K,V) test) {
    _map.removeWhere(test);
    _notifyMapChanged();
  }
  
  @override
  V? operator [](Object? key) {
    return _map[key];
  }
  
  @override
  void operator []=(K key, V value) {
    _map[key] = value;
    _notifyMapChanged();
  }
  
  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    _map.addEntries(newEntries);
    _notifyMapChanged();
  }
  
  @override
  bool containsKey(Object? key) {
    return _map.containsKey(key);
  }
  
  @override
  bool containsValue(Object? value) {
    return _map.containsValue(value);
  }
  
  @override
  Iterable<MapEntry<K, V>> get entries => _map.entries;
  
  @override
  // TODO: implement keys
  Iterable<K> get keys => _map.keys;
  
  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K, V) convert) {
    return _map.map(convert);
  }
  
  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    final putted = _map.putIfAbsent(key, ifAbsent);
    _notifyMapChanged();
    return putted;
  }
  
  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    final updated = _map.update(key, update, ifAbsent: ifAbsent);
    _notifyMapChanged();
    return updated;
  }
  
  @override
  void updateAll(V Function(K key, V value) update) {
    _map.updateAll(update);
    _notifyMapChanged();
  }
  
  @override
  Iterable<V> get values => _map.values;
}
