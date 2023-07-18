/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HoangNQ
 */
public class Cart {

    private Map< String, Comestic> cart;

    public Cart() {
    }

    public Cart(Map<String, Comestic> cart) {
        this.cart = cart;
    }

    public Map<String, Comestic> getCart() {
        return cart;
    }

    public void setCart(Map<String, Comestic> cart) {
        this.cart = cart;
    }

    public boolean add(String id, Comestic comestics) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(id)) {
                int currentQuantity = this.cart.get(id).getQuantity();
                comestics.setQuantity(currentQuantity + comestics.getQuantity());
            }
            this.cart.put(id, comestics);
            check = true;
        } catch (Exception e) {
        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }

        } catch (Exception e) {
        }
        return check;
    }

    public boolean edit(String id, Comestic comestic) {

        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, comestic);
                    check = true;
                }
            }

        } catch (Exception e) {
        }
        return check;
    }
}
