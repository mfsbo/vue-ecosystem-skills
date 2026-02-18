---
number: 125
title: VueUiXyCanvas not reacting to dataset updates
category: Q&A
created: 2024-12-05
url: "https://github.com/graphieros/vue-data-ui/discussions/125"
upvotes: 1
comments: 13
answered: true
---

# VueUiXyCanvas not reacting to dataset updates

I try to use the VueUiXyCanvas graph to display a spectrum that will update every 100 ms but the spectrum is only showing the first dataset. It are 800 data points that update every time, and the graph is very nice.   
To update the data set I use now a longpoll as test
```
const uuid = generateUUID(); 

const dataset = ref([
   {
        name: "",
        series: [1],
        type: "line",
        color: "rgb(95,139,238)",
        scaleSteps: 5,
        dataLabels: false
    }]);

async function longpolling ()
{
  try {
    const message = {"identifier": uuid, "type": "spectrum"};
    const response = await axios.post('/api/spectrum', message);
    //console.log('Fetched data:', response.data); // Log the fetched data to the console
    dataset.value[0].series = response.data;
    //console.log("data",dataset.value[0].series); 
  }
    catch (error) {
    console.error('error fetching wsjtx data', error);
  }
  finally {
    setTimeout(longpolling, 1);
  }
}

onMounted(async () => {
  longpolling();
});
```...

---

## Accepted Answer

**@graphieros** [maintainer]:

Hi Paul :)

Thanks for pointing this out, a watcher on the dataset was missing.
You can upgrade to v2.4.22 which solves this issue.

Using VueUiXyCanvas is a good choice indeed for this kind of big dataset with frequent update, as the browser doesn't have to manage thousands of DOM nodes.

Cheers