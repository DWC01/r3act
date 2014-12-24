// $(document).ready( function(){

//   //Width and height
//   var w = 500;
//   var h = 200;
//   var barPadding = 1;  // <-- New!


//   datas = d3.csv("items.csv", function(error, dataset) {

//     var svg = d3.select("#r3act").append("svg").attr("class", "bar-graph")
//                 .attr("width", w)
//                 .attr("height", h);

//        svg.selectAll(".item1")
//        .data(dataset)
//        .enter()
//        .append("rect")
//        .attr("class", "item1")
//        .attr("x", function(d, i){
//          return i * (w/dataset.length);
//        })
//        .attr("y", function(d){
//          return h-(d.item1);
//        })
//        .attr("width", (w/dataset.length)-barPadding)
//        .attr("height", function(d) {
//           return (d.item1);
//        })

//        svg.selectAll(".item2")
//        .data(dataset)
//        .enter()
//        .append("rect")
//        .attr("class", "item2")
//        .attr("x", function(d, i){
//          return i * (w/dataset.length);
//        })
//        .attr("y", function(d){
//          return h-((d.item1*2));
//        })
//        .attr("width", (w/dataset.length)-barPadding)
//        .attr("height", function(d) {
//           return (d.item1);
//        });

//        svg.selectAll(".item3")
//        .data(dataset)
//        .enter()
//        .append("rect")
//        .attr("class", "item3")
//        .attr("x", function(d, i){
//          return i * (w/dataset.length);
//        })
//        .attr("y", function(d){
//          return h-((d.item1*3));
//        })
//        .attr("width", (w/dataset.length)-barPadding)
//        .attr("height", function(d) {
//           return (d.item1);
//        });

//        svg.selectAll(".item4")
//        .data(dataset)
//        .enter()
//        .append("rect")
//        .attr("class", "item4")
//        .attr("x", function(d, i){
//          return i * (w/dataset.length);
//        })
//        .attr("y", function(d){
//          return h-((d.item1*4));
//        })
//        .attr("width", (w/dataset.length)-barPadding)
//        .attr("height", function(d) {
//           return (d.item1);
//        });

//        svg.selectAll(".item5")
//        .data(dataset)
//        .enter()
//        .append("rect")
//        .attr("class", "item5")
//        .attr("x", function(d, i){
//          return i * (w/dataset.length);
//        })
//        .attr("y", function(d){
//          return h-((d.item1*5));
//        })
//        .attr("width", (w/dataset.length)-barPadding)
//        .attr("height", function(d) {
//           return (d.item1);
//        });

//        svg.selectAll(".item6")
//        .data(dataset)
//        .enter()
//        .append("rect")
//        .attr("class", "item6")
//        .attr("x", function(d, i){
//          return i * (w/dataset.length);
//        })
//        .attr("y", function(d){
//          return h-((d.item1*6));
//        })
//        .attr("width", (w/dataset.length)-barPadding)
//        .attr("height", function(d) {
//           return (d.item1);
//        });

//   });

// });