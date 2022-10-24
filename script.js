const app = new Vue({
  el: "#app",
  data: {
    student: {},
    inputText: "",
    
  },
  mounted() {
  },
  methods: {
    searchStudent() {
      axios.get("api/searchStudent.php", {params: {regNum: this.inputText}})
        .then(({ data }) => {
          if(data)
            this.student = data;
          console.log(data)
      })
    }
  },
});