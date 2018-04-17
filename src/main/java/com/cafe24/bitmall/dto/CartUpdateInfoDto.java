package com.cafe24.bitmall.dto;

import com.cafe24.bitmall.vo.CartVo;

public class CartUpdateInfoDto {
	CartVo cart;
	Long originQuantity;

	public CartVo getCart() {
		return cart;
	}

	public void setCart(CartVo cart) {
		this.cart = cart;
	}

	public Long getOriginQuantity() {
		return originQuantity;
	}

	public void setOriginQuantity(Long originQuantity) {
		this.originQuantity = originQuantity;
	}

	@Override
	public String toString() {
		return "CartUpdateInfoDto [cart=" + cart + ", originQuantity=" + originQuantity + "]";
	}

}
