<template>
  <div class="modal-backdrop">
    <div class="modal">
      <header class="modal-header">
        <slot name="header"> <strong> Success! </strong> </slot>
        <button type="button" class="btn-close" @click="close">x</button>
      </header>

      <section class="modal-body">
        <slot name="body"> Keep shooping or go cart! </slot>
      </section>

      <footer class="modal-footer">
        <slot name="footer"> </slot>
        <router-link class="normal" @click="close" to="/shop">Shopping</router-link>
        <router-link class="normal" @click="close" to="/cart">Cart</router-link>
      </footer>
    </div>
  </div>
</template>


<script>
export default {
  name: "Modal",
  methods: {
    close() {
      this.$emit("close");
    },
  },
};
</script>


<style scoped>
    .modal-backdrop {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: rgba(0, 0, 0, 0.3);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .modal {
        background: #FFFFFF;
        box-shadow: 1px 1px 30px 1px #444; 
        overflow: hidden;
        display: flex;
        flex-direction: column;
        border-radius: 10px;
        width: 480px;
        height: 230px;
    }
    .modal-header,
    .modal-footer {
        display: flex;
        justify-content: space-between;
    }
    .modal-header {
        padding: 30px 40px 12px 40px;
        position: relative;
        border-bottom: 1px solid #eeeeee;
        color: #088178;
        justify-content: space-between;
        font-size: 20px;

    }
    .modal-footer {
        border-top: 1px solid #eeeeee;
        padding: 10px 40px 20px 40px;
    }

    .modal-body {
        position: relative;
        padding: 30px 40px;
        font-size: 15px;
    }

    .modal-footer a {
        font-size: 14px;
        font-weight: 600;
        padding: 15px 30px;
        border-radius: 4px;
        cursor: pointer;
        border: none;
        outline: none;
        transition: 0.2s;
        background-color: #088178;
        color: #fff;
        padding: 12px 10px;
        width: 100px;
        height: 40px;
        text-align: center;
    }

    .btn-close {
        position: absolute;
        top: 0;
        right: 0;
        border: none;
        font-size: 20px;
        padding: 15px 20px 0px 0px;
        cursor: pointer;
        font-weight: bold;
        color: #088178;
        background: transparent;
    }
    .modal-footer a:hover {
        background-color: #fff;
        color: #000;
        border: 1px solid #444;
    }
    .btn-close:hover {
        color: #000;
    }
    @media (max-width:500px) { 
        .modal {
            width: 320px;
            height: 230px;
        }
    }
</style>