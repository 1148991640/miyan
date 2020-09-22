<template>
  <div class="content">
    <Aa />
    <Bb />
  </div>
</template>

<script>
import Aa from "@/components/Aa";
import Bb from "@/components/Bb";
export default {
  props: [],
  data() {
    return {};
  },
  created() {
    console.log(this);
  },
  mounted() {},
  components: { Aa, Bb },
  methods: {},
};
</script>

<style scoped>
.content {
  display: flex;
  justify-content: space-between;
  width: 1200px;
  border: 2px solid blue;
  margin: 0 auto;
  color: #fff;
}
</style>
