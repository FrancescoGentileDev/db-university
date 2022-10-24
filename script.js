const app = new Vue({
  el: "#app",
  data: {
    student: "",
    inputText: "",
    exams: "",
    
  },
  mounted() {
  },
  methods: {
    searchStudent() {
      axios.get("api/searchStudent.php", {params: {regNum: this.inputText}})
        .then(({ data }) => {
          if(data){
            this.student = data;
            axios.get("api/searchexams.php", { params: { studId: this.student.id } })
              .then((res) => {
                this.exams = res.data
                console.log("esami",this.exams)
            })
          }
          
      })
    }
  },
});