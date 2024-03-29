package com.model.cart;

import java.util.List;

public interface CartMapper {
  int create(CartDTO dto);

  List<CartDTO> list(String id);

  void delete(int cartno);

  void deleteAll(String id);
}
