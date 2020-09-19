import moment from "moment";
moment.locale("zh-cn");

export default {
  pixImg: function(val, pix = "http://localhost:3030") {
    return pix + val;
  },
  pixTime: function(val) {
    // let date = new Date(parseInt(val));
    // let date2 = date.toLocaleString();

    // return date2;
    let time = moment(parseInt(val)).format("YYYY-MM-DD HH:mm:SS");
    return time;
  }
};
